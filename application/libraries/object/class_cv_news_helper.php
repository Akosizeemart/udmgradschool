<?php

class CV_News_Helper {
	public static function isIdExist(CV_News $n) {
		$sql = "
			SELECT COUNT(id) as total
			FROM  " . CV_News . "
			WHERE id = ". Model::safeSql($n->getId()) ."
		";

		$result = Model::runSql($sql);
		$row = Model::fetchAssoc($result);
		return $row['total'];
	}
	
	public static function getBasicInfoById($id) {
		$sql = "
			SELECT 
				n.id, 
				n.news_id,
				n.title,
				n.content,
			FROM " . CV_News . " n
			WHERE id = ". Model::safeSql($id) ."
			LIMIT 1
		";
		return Model::runSql($sql,true, false);
		
	}
	
	public static function getNextId() {
		$sql = "
			SELECT n.id 
			FROM " . CV_NEWS . " n
			ORDER BY id DESC
			LIMIT 1
		";
	
		$var = Model::runSql($sql,true, false);
		$next_id = ($var ? $var['id'] + 1 : '1');
		return $next_id;
	}
	

	public static function updateNewsInContent(CV_News $n) {
		$sql = "
			UPDATE " . CV_NEWS . " SET
			title = " . Model::safeSql($n->getTitle()) . "
			WHERE
				id = " . Model::safeSql($n->getId()) . "
		";
		Model::runSql($sql);
	}
	public static function updateNews(CV_News $n) {
		$sql = "
			UPDATE " . CV_NEWS . " SET
			title = " . Model::safeSql($n->getTitle()) . "
			WHERE
			id = " . Model::safeSql($n->getId()) . "
		";
		Model::runSql($sql);
	}
	
	

	

}

?>