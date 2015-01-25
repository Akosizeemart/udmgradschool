<?php 
class News extends CI_Controller {
	function __construct() {
		 parent::__construct();
		 $this->load->library('session');
		 $this->load->library('loader.php');
 		 $this->load->database();

		 Loader::style('style.css');
		 
		 $this->member_session_check();
		 
		 $h_news_id 		= Utilities::encrypt(1);
		 $this->news_id 	= Utilities::decrypt($h_news_id);
		 
		 $this->user_access = Utilities::decrypt($_SESSION['egrade']['account_type']);
		 Utilities::verifyAccess($this->user_access,'news');
	}
	
	function index1(){
		Loader::style('template.css');
		//Loader::script('bootstrap/modal.js');
		Loader::script('bootstrap/tooltip.js');
		Loader::script('news.js');
		Jquery::jq_datatable();
		
		//$data['page_title'] = 'eGrade | Courses';
		$data['page_title'] = 'Universidad de Manila - Grad School :: News';
		$data['selected']   = 'news';
		$this->load->view('news/index.php', $data);	
	}
	
	function index() {
		Loader::style('template.css');
		Loader::script('news.js');
		Twitter_Bootstrap::modal();
		Jquery::jq_datatable();
		Jquery::inline_validation();
		Jquery::form();
		Jquery::tipsy();
		$data['page_title'] = 'Universidad de Manila - Grad School :: News';
		$data['selected']   = 'news';
		
		$this->load->view('news/index.php',$data);
	}
	
	function load_news_list_dt() {
		$this->load->view('news/news_list_dt.php');
	}
	
	function load_server_news_list_dt() {
		Utilities::ajaxRequest();
		
		
		$dt = new Datatable();
		$c  = $_GET['iDisplayStart'];
		$dt->setPagination(1);
		$dt->setStart(1);
		$dt->setStartIndex(0);
		$dt->setDbTable(CV_NEWS);
		$dt->setCustomField();
		$dt->setColumns('id,title,content');
		$dt->setOrder('ASC');
		$dt->setStartIndex(0);
		$dt->setSort(0);		
		$dt->setNumCustomColumn(1);
		$dt->setCustomColumn(	
		array(
		'1' => '<div class=\"i_container\"><ul class=\"dt_icons\"><li><a title=\"Edit\" id=\"edit\" class=\"ui-icon ui-icon-pencil g_icon\" href=\"javascript:void(0);\" onclick=\"javascript:_showEditNewsForm(\'e_id\');\"></a></li><li><a title=\"Delete\" id=\"delete\" class=\"ui-icon ui-icon-trash g_icon\" href=\"javascript:void(0);\" onclick=\"javascript:_deleteNewsDialog(\'e_id\')\"></a></li></ul></div>'));
		echo $dt->constructDataTable();
	}
	
	function ajax_add_news_form() {
	
			$next_id 	= CV_News_Helper::getNextId();
		
		
		$data['news_id']	= date('Ym') .str_pad($next_id, 4, "00", STR_PAD_LEFT);
	    $data['action_url'] = 'news/ajax_insert_update_news';
        $this->load->view('news/forms/add_news.php',$data);
	}
	
	function ajax_edit_news_form() {
		if(!empty($_POST)) {
			$data['action_url'] = 'news/ajax_insert_update_news';
			$data['news']= $news= CV_News_Finder::findById(Utilities::decrypt($_POST['h_id']));
			$this->load->view('news/forms/edit_news.php',$data);
		}
	}
	
	function ajax_insert_update_news() {
		if(!empty($_POST)) {
			if(!empty($_POST['h_id'])) {
				$n =  CV_News_Finder::findById(Utilities::decrypt($_POST['h_id']));
			} else {
				$n =  new CV_News();
			}
			
			$n->setId($_POST['id']);
			$n->setTitle($_POST['title']);
			$n->setContent($_POST['content']);
			$n->save();
			
		    $id	= $_POST['id'];
			$title	= $_POST['title'];
			$content 	= $_POST['content'];

			
			CV_News_Helper::updateNews($n);
		}
	}
	
	function ajax_delete_news_form() {
		if(!empty($_POST)) {
			$data['action_url'] = 'news/ajax_delete_news';
			$data['news']= $news = CV_News_Finder::findById(Utilities::decrypt($_POST['h_id']));
			$this->load->view('news/forms/delete_news.php',$data);
		}
	}
	
	function ajax_delete_news() {
		if(!empty($_POST)) {
			$news = CV_News_Finder::findById(Utilities::decrypt($_POST['h_id']));
			$news->save();
		}
	}
}
?>