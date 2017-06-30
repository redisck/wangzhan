<?php
namespace app\index\controller;
use \think\View;
use \think\Request;
use \think\Db;
use \think\Controller;
use \think\Cache;
class Admin extends Controller
{
    public function index()
    {
		$view = new View();
		return view('index');
	
	}
	
	public function login(){
		
			$data['admin_name'] = Request::instance()->param('email');
			$data['admin_password'] = md5(Request::instance()->param('paword'));
			
			$result = Db::table('hm_admin')->where($data)->find();
		
			if($data['admin_name'] == $result['admin_name'] && $data['admin_password'] == $result['admin_password']){
				$RoleResult = Db::table('hm_role')->where('id',$result['role_id'])->find();
				Cache::set('role_name',$RoleResult['name'],3600*60);
				Cache::set('role_id',$RoleResult['id'],3600*60);
				Cache::set('admin_name',$data['admin_name'],3600);
				Cache::set('admin_password',$data['admin_password'],3600);
				$this->redirect('index/index');
			}
			

	}
	
		public function logout(){
		Cache::rm('role_name');
		Cache::rm('role_id');
		Cache::rm('admin_name');
		Cache::rm('admin_password'); 
		$this->redirect('Admin/login');
		
	}
	
	
}
