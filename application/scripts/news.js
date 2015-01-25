function load_news_list_dt() {
	//$('#course_list_dt_wrapper').html(loading_message);
	$.get(base_url + 'news/load_news_list_dt',{},
	function(o){
		$('#news_list_dt_wrapper').html(o);
	});
}

function _showAddNewsForm() {
	$('#show_news_form_link').hide();
	$('#news_list_dt_wrapper').hide();
	$('#close_news_form_link').show();
	$('#show_news_form_wrapper').show();
	$('#show_news_form_wrapper').html(loading_message);
	$.post(base_url + 'news/ajax_add_news_form',{},function(o) {
		$('#show_news_form_wrapper').html(o);
	});
}

function _showEditNewsForm(news_id) {
	$('#show_news_form_link').hide();
	$('#news_list_dt_wrapper').hide();
	$('#close_news_form_link').show();
	$('#show_news_form_wrapper').show();
	$('#show_news_form_wrapper').html(loading_message);
	$.post(base_url + 'news/ajax_edit_news_form',{news_id:news_id},function(o) {
		$('#show_news_form_wrapper').html(o);
	});
} 


function _closeNewsForm() {
	$('#show_news_form_link').show();
	$('#news_list_dt_wrapper').show();
	$('#close_news_form_link').hide();
	$('#show_news_form_wrapper').hide();
	
	$("#add_news_form").validationEngine('hide');
	$("#edit_news_form").validationEngine('hide');
}

function _showAddNewsDialog() {
	$.post(base_url + 'news/ajax_add_news_form',{},function(o) {
		$('#add_news_form_modal_wrappper').html(o);
		$('#add_news_form_modal_wrappper').modal();
		
		$('#add_news_form_modal_wrappper').on('hidden', function () {
		  $("#add_news_form").validationEngine('hide');
		})
	});
}

function _editNewsDialog(news_id) {
	$.post(base_url + 'news/ajax_edit_news_form',{news_id:news_id},function(o) {
		$('#edit_news_form_modal_wrappper').html(o);
		$('#edit_news_form_modal_wrappper').modal();
		
		$('#edit_news_form_modal_wrappper').on('hidden', function () {
		  $("#edit_news_form").validationEngine('hide');
		})
	});
}

function _deleteNewsDialog(news_id) {
	$.post(base_url + 'news/ajax_delete_news_form',{news_id:news_id},function(o) {
		$('#delete_news_form_modal_wrappper').html(o);
		$('#delete_news_form_modal_wrappper').modal();
	});
}