package api.app.showInTaskList
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	[Bindable]
	public class ShowInTaskList extends App
	{
		public var flag:Boolean = true;
		
		public function ShowInTaskList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			flag = true;
			showInTaskList();
		}
		public function hide():void
		{
			flag = false;
			showInTaskList();
		}
		private function showInTaskList():void
		{
			ssCore.App.showInTaskList( {flag:flag} , {callback:actionComplete, errorSTR:"showInTaskListError", code:"8022"} );
		}
	}
}