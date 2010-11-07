package api.app.enableFlashMenu
{
	import flash.events.IEventDispatcher;
	
	
	import api.app.App;

	[Bindable]
	public class EnableFlashMenu extends App
	{
		// Optional
		public var flag:Boolean = true;
		
		public function EnableFlashMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function enable():void
		{
			flag = true;
			setMenu();
		}
		public function disable():void
		{
			flag = false;
			setMenu();
		}
		private function setMenu():void
		{
			ssCore.App.enableFlashMenu( {flag:flag} , {callback:actionComplete, errorSTR:"enableFlashMenuError", code:"8008"} );
		}
	}
}