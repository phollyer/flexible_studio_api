package api.app.showInTaskBar
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;

	[Bindable]
	public class ShowInTaskBar extends App
	{
		public var flag:Boolean = true;
		
		public function ShowInTaskBar(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			flag = true;
			showInTaskBar();
		}
		public function hide():void
		{
			flag = false;
			showInTaskBar();
		}
		private function showInTaskBar():void
		{
			ssCore.App.showInTaskbar( {flag:flag} , {callback:actionComplete, errorSTR:"showInTaskBarError", code:"8021"} );
		}
	}
}