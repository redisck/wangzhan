<?php
namespace app\index\controller;
use \think\View;
use \think\Request;
use \think\Db;
use \think\Controller;
use \think\Cache;
class User extends Controller
{
    public function index()
    {
		
		$view = new View();
		$view->assign('roleName',Cache::get('role_name'));
		return view();
	
	}
	
	
	public function add(){
		
		$view = new View();
			//$view->assign('roleName',Cache::get('role_name'));
		return view();
		
	}
	
	public function user_list(){
		
		$result = Db::table('hm_user')->field('id,user_name,user_pwd,create_time,email,mobile,my_intro')->select();
		
		$view = new View();
		
		$this->assign('data',$result);
		
		return view('list');
	}
	
	
	public function doadd(){
		
		$data['user_name'] = Request::instance()->param('user_name');
		$data['email'] = Request::instance()->param('email');
		$data['mobile'] = Request::instance()->param('mobile');
		$data['user_pwd'] = md5(Request::instance()->param('user_pwd'));
		$data['weixin'] = Request::instance()->param('weixin');
		$data['my_intro'] = Request::instance()->param('my_intro');
		
		$result = Db::table('wlz_user')->insert($data);
		if($result){
			  $this->success('新增成功', 'index/index');
		}else{
				$this->error('新增失败');	
		}
		
	}
	
	
	
}
