package api.desktop.autoHideTaskbar
{
	import flash.events.IEventDispatcher;
	
	import api.desktop.Desktop;
	
	[Bindable]
	public class AutoHideTaskbar extends Desktop
	{
		// Optional
		public var flag:Boolean = true;
		
		public function AutoHideTaskbar(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function autoHideTaskbar():void
		{
			ssCore.Desktop.autoHideTaskbar( {flag:flag}
										   ,{callback:actionComplete, errorSTR:"autoHideTaskbarError", code:"19000"} );
		}
	}
}