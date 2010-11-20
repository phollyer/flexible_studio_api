package api.console.setTopmost
{
	import flash.events.IEventDispatcher;
	
	import api.console.Console;
	
	[Bindable]
	public class SetTopmost extends Console
	{
		public var flag:Boolean = true;
		
		public function SetTopmost(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setTopmost():void
		{
			flag = true;
			setWindow();
		}
		public function clearTopmost():void
		{
			flag = false;
			setWindow();
		}
		private function setWindow():void
		{			
			ssCore.Console.setTopmost( {flag:flag} , {callback:actionComplete, errorSTR:"setTopmostError", code:"14003"} );
		}
	}
}