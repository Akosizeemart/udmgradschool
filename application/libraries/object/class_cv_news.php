<?php
class CV_News {

	public $id;
	public $news_id;
	public $title;
	public $content;



	public function setId($value) { $this->id = $value; }
	public function getId() { return $this->id; }
	public function setNewsId($value) { $this->news_id = $value; }
	public function getNewsId() { return $this->news_id; }
	
	public function setTitle($value) {$this->title = $value;}
	public function getTitle() {return $this->title;}
	
	public function setContent($value) {$this->content = $value;}
	public function getContent() {return $this->content;}
	

	
	public function save(CV_News $n) {
		return CV_News_Manager::save($this);
	}

	public function delete() {
		return CV_News_Manager::delete($this);
	}
}

?>