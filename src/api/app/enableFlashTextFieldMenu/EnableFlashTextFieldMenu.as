package api.app.enableFlastTextFieldMenu
{
	import flash.events.IEventDispatcher;
	
	
	import api.app.App;

	[Bindable]
	public class EnableFlashTextFieldMenu extends App
	{
		// Optional
		public var flag:Boolean = true;
		
		public function EnableFlashTextFieldMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function disable():void
		{
			flag = false;
			setMenu();
		}
		public function enable():void
		{
			flag = true;
			setMenu();
		}
		private function setMenu():void
		{
			ssCore.App.enableFlashTextFieldMenu( {flag:flag} , {callback:actionComplete, errorSTR:"enableFlashTextFieldMenuError", code:"8009"} );
		}
	}
}