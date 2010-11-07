package api.app.setKioskMode
{
	import flash.events.IEventDispatcher;
	
	
	import api.app.App;

	[Bindable]
	public class SetKioskMode extends App
	{
		public var flag:Boolean = false;
		
		public function SetKioskMode(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function enableKioskMode():void
		{
			flag = true;
			setKioskMode();
		}
		public function disableKioskMode():void
		{
			flag = false;
			setKioskMode();
		}
		private function setKioskMode():void
		{
			ssCore.App.setKioskMode( {flag:flag} , {callback:actionComplete, errorSTR:"setKioskModeError", code:"8016"} );
		}
	}
}