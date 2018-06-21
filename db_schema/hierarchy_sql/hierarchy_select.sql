SELECT * FROM nested_category ORDER BY category_id;

SELECT node.name, (COUNT(parent.name) - 1) AS depth
FROM nested_category AS node,
nested_category AS parent
WHERE node.lft BETWEEN parent.lft AND parent.rgt
GROUP BY node.name
ORDER BY node.lft;

SELECT node.category_id as node_category, 
	node.lft as node_lft, 
	node.rgt as node_rgt,
	parent.category_id as parent_category, 
	parent.lft as parent_lft, 
	parent.rgt  as parent_rgt,
	CONCAT( REPEAT(' ', COUNT(parent.name) - 1), node.name) AS name, 
	(COUNT(parent.name) - 1) AS depth
FROM nested_category AS node,
	 nested_category AS parent
WHERE node.lft BETWEEN parent.lft AND parent.rgt
GROUP BY node.name
ORDER BY node.lft;

SELECT node.category_id as node_category, 
	node.lft as node_lft, node.rgt as node_rgt,
	parent.category_id as parent_category, 
	parent.lft as parent_lft, parent.rgt  as parent_rgt,
	CONCAT( REPEAT(' ', COUNT(parent.name) - 1), node.name) AS name, 
	(COUNT(parent.name) - 1) AS depth
FROM nested_category AS node,
	nested_category AS parent
WHERE node.lft BETWEEN 4 AND 4+10
GROUP BY node.name
ORDER BY node.lft;
