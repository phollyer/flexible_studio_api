package api.desktop.autoRestoreTaskbar
{
	import flash.events.IEventDispatcher;
	
	import api.desktop.Desktop;

	[Bindable]
	public class AutoRestoreTaskbar extends Desktop
	{
		// Optional
		public var flag:Boolean = true;
		
		public function AutoRestoreTaskbar(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function autoRestoreTaskbar():void
		{
			ssCore.Desktop.autoRestoreTaskbar( {flag:flag}
											  ,{callback:actionComplete, errorSTR:"autoRestoreTaskbarError", code:"19001"} );
		}
	}
}