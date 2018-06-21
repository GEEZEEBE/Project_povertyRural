-- USER_ROLES
delete from USER_ROLES;

INSERT INTO USER_ROLES (USER_ROLE_ID, AUTHORITY, USER_ID) VALUES ('12313131', 'ROLE_USER', 'kut0000');
INSERT INTO USER_ROLES (USER_ROLE_ID, AUTHORITY, USER_ID) VALUES ('12313133', 'ROLE_USER', 'kut0100');


select NAME username, PW password, USER_ID 
		      from TB_UAST_USER where NAME='kut0000'
		      
		      		      select usr.user_id username, roles.authority 
			from TB_UAST_USER usr
					,USER_ROLES roles
			where usr.user_id = roles.user_id
			and usr.NAME ='kut0000'