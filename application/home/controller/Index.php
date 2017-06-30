<?php
namespace app\home\controller;
use \think\View;
class Index
{
    public function index()
    {
		$view = new View();
		return view('index');
	
	}
}
