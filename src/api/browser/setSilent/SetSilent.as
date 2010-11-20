package api.browser.setSilent
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class SetSilent extends Browser
	{
		public var _flag:Boolean = false;
		
		public function SetSilent(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setSilent():void
		{
			_flag = true;
			setDialogs();
		}
		public function clearSilent():void
		{
			_flag = false;
			setDialogs();
		}
		private function setDialogs():void
		{
			ssCore.Browser.setSilent( {flag:_flag} , {callback:actionComplete, errorSTR:"setSilentError", code:"10037"} );
		}
	}
}