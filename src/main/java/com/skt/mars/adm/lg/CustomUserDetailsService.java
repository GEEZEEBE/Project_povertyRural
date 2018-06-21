package com.skt.mars.adm.lg;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

/**
 * A custom {@link UserDetailsService} where user information is retrieved from
 * a JPA repository
 */
@Service
@Transactional(readOnly = true)
public class CustomUserDetailsService implements UserDetailsService {

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	/**
	 * Returns a populated {@link UserDetails} object. The username is first
	 * retrieved from the database and then mapped to a {@link UserDetails}
	 * object.
	 */
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		try {

			String sqlMapId = "user.check.login";
			Map requestMap = new HashMap();
			requestMap.put("userID", username);

			com.skt.mars.adm.ui.User domainUser = (com.skt.mars.adm.ui.User) commonDao
					.selectByCategoryID(sqlMapId, requestMap);
			/*
			 * com.skt.mars.adm.ui.User domainUser = new
			 * com.skt.mars.adm.ui.User();
			 * 
			 * domainUser.setName(username); domainUser.setPw(username);
			 */
			boolean enabled = true;
			boolean accountNonExpired = true;
			boolean credentialsNonExpired = true;
			boolean accountNonLocked = true;
			
			
			int authorities = 2;
			// record visitor history
			if(domainUser != null){
				sqlMapId = "using.insertBySrvID";
				
				String userAuthority =  domainUser.getAuthority();
				
				// srvc id by authority("U" : user, the others : Manager) 
				if("U".equals(userAuthority)){	// User
					requestMap.put("srvcID", 30);
					authorities = 2;
				} else {	// Manager
					requestMap.put("srvcID", 29);
					authorities = 1;
				}
				
                String randomCategory = DateFormatUtil.getRandomID();
                requestMap.put("useHsNmbrID", randomCategory); // use_hs_nmbr_id
                requestMap.put("userid", domainUser.getUserID()); // use__id
                requestMap.put("endYN", "E"); // end Y or N
                requestMap.put("END_TM", randomCategory.substring(0, 17)); // end Y or N

                commonDao.insert(sqlMapId, requestMap);
			} else {
				throw new UsernameNotFoundException("user not found");
			}

			CustomUser user = new CustomUser(domainUser.getUserID() ,domainUser.getName(), domainUser.getPw()
					.toLowerCase(), enabled, accountNonExpired,
					credentialsNonExpired, accountNonLocked, getAuthorities(authorities));
						
			return user;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * Retrieves a collection of {@link GrantedAuthority} based on a numerical
	 * role
	 * 
	 * @param role
	 *            the numerical role
	 * @return a collection of {@link GrantedAuthority
	 */
	public Collection<? extends GrantedAuthority> getAuthorities(Integer role) {
		List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
		return authList;
	}

	/**
	 * Converts a numerical role to an equivalent list of roles
	 * 
	 * @param role
	 *            the numerical role
	 * @return list of roles as as a list of {@link String}
	 */
	public List<String> getRoles(Integer role) {
		List<String> roles = new ArrayList<String>();

		if (role.intValue() == 1) {
			roles.add("ROLE_USER");
			roles.add("ROLE_ADMIN");

		} else if (role.intValue() == 2) {
			roles.add("ROLE_USER");
		}

		return roles;
	}

	/**
	 * Wraps {@link String} roles to {@link SimpleGrantedAuthority} objects
	 * 
	 * @param roles
	 *            {@link String} of roles
	 * @return list of granted authorities
	 */
	public static List<GrantedAuthority> getGrantedAuthorities(
			List<String> roles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;
	}
}
