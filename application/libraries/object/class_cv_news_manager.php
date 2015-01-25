<?php
class CV_News_Manager {

	public static function save(CV_Members $n) {
		if (CV_News_Helper::isIdExist($n) > 0 ) {
			$sql_start = "UPDATE " . CV_NEWS;
			$sql_end = " WHERE id = ". Model::safeSql($n->getId());
		}else{
			$sql_start = "INSERT INTO " . CV_NEWS;
			$sql_end = "";		
		}
		
		$sql = $sql_start ."

			SET
			id				= " . Model::safeSql($n->getId()) . ",
			news_id				= " . Model::safeSql($n->getNews_Id()) . ",
		    title				= " . Model::safeSql($n->getTitle()) . ",
			content 			= " . Model::safeSql($n->getContent()) . ""
			. $sql_end ."			
		";
		Model::runSql($sql);
		return mysql_insert_id();		
	}		

	public static function delete(CV_News $n){

		if(CV_News_Finder::isIdExist($n) > 0){
			$sql = "
				DELETE FROM " . CV_NEWS . " 
				WHERE id =" . Model::safeSql($n->getId());

			Model::runSql($sql);
		}
	}
}

?>