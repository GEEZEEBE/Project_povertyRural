-- id, depth, parent name, child name
SELECT node.SRVC_ID, parent.SRVC_CTGR_NM parentNM,  node.SRVC_CTGR_NM childNM, (COUNT(parent.SRVC_CTGR_NM) - 1) AS depth
FROM TB_UAST_SRVC_CTGR AS node,
TB_UAST_SRVC_CTGR AS parent
WHERE node.LEFT_SRVC_ID BETWEEN parent.LEFT_SRVC_ID AND parent.RIGHT_SRVC_ID
-- AND node.SRVC_ID IN (4)	-- terms
GROUP BY node.SRVC_CTGR_NM
ORDER BY node.LEFT_SRVC_ID;

SELECT node.SRVC_ID as node_category, 
	node.LEFT_SRVC_ID as node_lft, 
	node.RIGHT_SRVC_ID as node_rgt,
	parent.SRVC_ID as parent_category, 
	parent.LEFT_SRVC_ID as parent_lft, 
	parent.RIGHT_SRVC_ID  as parent_rgt,
	CONCAT( REPEAT(' ', COUNT(parent.SRVC_CTGR_NM) - 1), node.SRVC_CTGR_NM) AS name, 
	(COUNT(parent.SRVC_CTGR_NM) - 1) AS depth
FROM TB_UAST_SRVC_CTGR AS node,
	 TB_UAST_SRVC_CTGR AS parent
WHERE node.LEFT_SRVC_ID BETWEEN parent.LEFT_SRVC_ID AND parent.RIGHT_SRVC_ID
GROUP BY node.SRVC_CTGR_NM
ORDER BY node.LEFT_SRVC_ID;

-- All category tree information
SELECT node.SRVC_ID as node_category, 
	node.LEFT_SRVC_ID as node_lft, 
	node.RIGHT_SRVC_ID as node_rgt,
	parent.SRVC_ID as parent_category, 
	parent.LEFT_SRVC_ID as parent_lft, 
	parent.RIGHT_SRVC_ID  as parent_rgt,
	parent.SRVC_CTGR_NM AS root_name,
	GROUP_CONCAT(parent.SRVC_CTGR_NM) AS category_name, 
	CONCAT( REPEAT('   ', COUNT(parent.SRVC_ID) - 1), node.SRVC_CTGR_NM) AS name, 
	(COUNT(parent.SRVC_ID) - 1) AS depth
FROM TB_UAST_SRVC_CTGR AS node,
	 TB_UAST_SRVC_CTGR AS parent
WHERE node.LEFT_SRVC_ID BETWEEN parent.LEFT_SRVC_ID AND parent.RIGHT_SRVC_ID
GROUP BY node.SRVC_ID
ORDER BY node.LEFT_SRVC_ID;

-- set Hidden category
update tb_uast_srvc_ctgr
set DEL_YN = 'H'
WHERE SRVC_ID IN (28,29,30,31,33,42);

-- get depth
SELECT 
	(COUNT(parent.SRVC_ID) - 1) AS depth,
	parent.SRVC_CTGR_NM AS root_name,
	node.SRVC_CTGR_NM AS node_name,
	GROUP_CONCAT(parent.SRVC_CTGR_NM) AS paren_category_name, 
	GROUP_CONCAT(parent.SRVC_ID) AS paren_categoryid_id, 
	CONCAT( REPEAT('   ', COUNT(parent.SRVC_ID) - 1), node.SRVC_CTGR_NM) AS name, 
	''
FROM (select * from TB_UAST_SRVC_CTGR order by LEFT_SRVC_ID desc) AS node,
	 (select * from TB_UAST_SRVC_CTGR) AS parent
WHERE node.LEFT_SRVC_ID BETWEEN parent.LEFT_SRVC_ID AND parent.RIGHT_SRVC_ID
GROUP BY node.SRVC_ID
ORDER BY node.LEFT_SRVC_ID;

-- get child node
SELECT node.SRVC_ID, node.SRVC_CTGR_NM
		, (COUNT(parent.SRVC_CTGR_NM) - (sub_tree.depth + 1)) AS depth
		, GROUP_CONCAT(node.SRVC_CTGR_NM) AS node_category_name 
		, GROUP_CONCAT(parent.SRVC_CTGR_NM) AS paren_category_name 
		, GROUP_CONCAT(sub_parent.SRVC_CTGR_NM) AS sub_parent_category_name 
		, GROUP_CONCAT(sub_tree.SRVC_CTGR_NM) AS sub_tree_category_name 
FROM TB_UAST_SRVC_CTGR AS node,
	TB_UAST_SRVC_CTGR AS parent,
	TB_UAST_SRVC_CTGR AS sub_parent,
	(
		SELECT node.SRVC_CTGR_NM, (COUNT(parent.SRVC_CTGR_NM) - 1) AS depth
		FROM TB_UAST_SRVC_CTGR AS node,
		TB_UAST_SRVC_CTGR AS parent
		WHERE node.left_srvc_id BETWEEN parent.left_srvc_id AND parent.RIGHT_SRVC_ID
		and node.SRVC_ID = 1		-- terms
--		AND node.SRVC_CTGR_NM = 'CBC Basic'
		GROUP BY node.SRVC_CTGR_NM
		ORDER BY node.left_srvc_id
	)AS sub_tree
WHERE node.left_srvc_id BETWEEN parent.left_srvc_id AND parent.RIGHT_SRVC_ID
	AND node.left_srvc_id BETWEEN sub_parent.left_srvc_id AND sub_parent.RIGHT_SRVC_ID
	AND sub_parent.SRVC_CTGR_NM = sub_tree.SRVC_CTGR_NM
GROUP BY node.SRVC_CTGR_NM
ORDER BY node.left_srvc_id;