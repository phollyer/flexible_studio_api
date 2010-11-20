package api.desktop.showTaskbar
{
	import flash.events.IEventDispatcher;
	
	import api.desktop.Desktop;
	
	[Bindable]
	public class ShowTaskbar extends Desktop
	{
		// Optional
		public var flag:Boolean = true;
		
		public function ShowTaskbar(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showTaskbar():void
		{
			ssCore.Desktop.showTaskbar( {flag:flag}
									   ,{callback:actionComplete, errorSTR:"showTaskbarError", code:"19004"} );
		}
	}
}