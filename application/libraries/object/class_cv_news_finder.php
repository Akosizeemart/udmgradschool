<?php
class CV_News_Finder {
	public static function findById($id) {
		$sql = "
			SELECT * 
			FROM " . CV_NEWS . "
			WHERE id = ". Model::safeSql($id) ."
			LIMIT 1
		";
		return self::getRecord($sql);
	}
	
	public static function findAll($sort = "", $limit = "") {
		$sql = "
			SELECT * 
			FROM " . CV_NEWS . "
			$sort
			$limit
		";
		return self::getRecords($sql);
	}

	public static function searchByTitleOrContentOrLocation($query) {
		$sql = "
	        SELECT id,news_id,title,content
	        FROM " . CV_NEWS . "
	        WHERE 
				(
					title LIKE '%{$query}%' OR
					content LIKE '%{$query}%' OR
					location LIKE '%{$query}%' OR
					news_id LIKE '%{$query}%'
				) AND (
					is_active = " . Model::safeSql(CV_News::YES) . "
				)
			"; 
			
		return self::getRecords($sql);
    }
	
   
	
	private static function getRecord($sql) {

		$result = Model::runSql($sql);
		$total = mysql_num_rows($result);
		if ($total == 0) {return false;}		
	
		$row = Model::fetchAssoc($result);
		$records = self::newObject($row);	
		return $records;
	}
	public static function findAllActiveNewsById($id) {
		$sql = "
			SELECT * 
			FROM " . CV_NEWS . "
			WHERE id =". Model::safeSql($id) ."
		";
		return self::getRecords($sql);
	}
	
	private static function getRecords($sql) {
		$result = Model::runSql($sql);
		$total = mysql_num_rows($result);
	
		if ($total == 0) {return false;}
		while ($row = Model::fetchAssoc($result)) {
			$records[$row['id']] = self::newObject($row);
		}
		return $records;
	}

	private static function newObject($row) {
		$var = new CV_NEWS($row['news_id']);
		$var->setId($row['id']);
			$var->setNewsId($row['news_id']);
		$var->setTitle($row['title']);
		$var->setContent($row['content']);
	
		return $var;
	}
}
?>