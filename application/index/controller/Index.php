<?php
namespace app\index\controller;
use \think\View;
class Index extends Base
{
    public function index()
    {
		$view = new View();
		return view('index');
	
	}
}
