<?php
namespace app\index\controller;
use \think\View;
class Activity extends Base
{
    public function index()
    {
		$view = new View();
		return view();
	
	}
	
	public function add(){
		
		$data['module_name'] = input('param.module_name');
		if(!file_exists($data['module_name']."php")){
			$myfile = fopen($data['module_name'].'.php',"w") or die("Unable to open file!");
			$txt = "Bill Gates\n";
			fwrite($myfile,$txt);
			fclose($myfile);
		}
	}
}
