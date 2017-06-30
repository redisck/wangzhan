<?php
namespace app\index\controller;
use \think\View;
use \think\Request;
use \think\Db;
use \think\Cache;
class Goods extends Base
{
    public function index()
    {
		$result = Db::table('hm_product')->field('id,title,vice_heading,activity,all_store,add_time,collect_status,img')->select();
		
		$view = new View();
		
		$view->assign('data',$result);
		$view->assign('roleName',Cache::get('role_name'));
		
		return $view->fetch('index');

	
	}
	
	public function add(){
		
		$view = new View();
		
		return view('add');
	}
	
	public function edit(){
		
		$request = Request::instance();
		$path = $request->path();
		$rs = explode("=",$path);
		
		$data = Db::table('hm_product')->where('id',$rs[1])->find();
		
		$this->assign('data',$data);
			
		$view = new View();
		
		return view();
	}
	
	
	 public function upload(){
		 
		 $file = request()->file('image');
		 if($file==NULL){
			 $rs = $_SERVER["HTTP_REFERER"];
			$this->redirect($rs); 
		 }
		$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
		if($info){
		}else{

			echo $file->getError();
		}
		$data['title'] = $_POST['shopname'];
		$data['all_store'] = $_POST['all_store'];
		$data['add_time'] = strtotime($_POST['time']);
		$data['vice_heading'] = $_POST['vice_heading'];
		$data['city'] = $_POST['city_id'];
		$data['img'] = $info->getSaveName();
		$data['activity'] = $_POST['editorValue'];
		$result = Db::table('hm_product')->insert($data);
		if($result){
			$this->success('添加成功','Goods/index');
		}else{
			$this->error('新增失败');
		}
		
	} 
	
	public function doedit(){
		
		$file = request()->file('image');
		 if($file==NULL){
			 $rs = $_SERVER["HTTP_REFERER"];
			$this->redirect($rs); 
		 }
		$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
		if($info){
		}else{

			echo $file->getError();
		}
		$data['id'] = input('?post.id');
		$data['title'] = input('?post.shopname');
		//$data['supplier_name'] = $_POST['supplier_name'];
		$data['begin_time'] = strtotime($_POST['time']);
		$data['current_price'] = $_POST['current_price'];
		$data['city_id'] = $_POST['city_id'];
		$data['cate_id'] = $_POST['cate_id'];
		//$data['measures'] = $_POST['measurement'];
		$data['img'] = $info->getSaveName();
		$data['activity'] = $_POST['editorValue'];
		$result = Db::table('hm_product')->where('id',$data['id'])->update(['title'=>$data['title'],'add_time'=>$data['begin_time'],
			'city'=>$data['city_id'],
			'all_store'=>$data['cate_id'],
			//'color'=>$data['color'],
			//'measures'=>$data['measures'],
			'img'=>$data['img'],
			'activity'=>$data['activity'],
		]);
		if($result){
			$this->success('修改成功','Goods/index');
		}else{
			$this->error('修改失败');
		}
	}
	
}
