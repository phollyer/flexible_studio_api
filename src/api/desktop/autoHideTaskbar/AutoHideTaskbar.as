package api.desktop.autoHideTaskbar
{
	import api.desktop.Desktop;

	import api.events.desktop.autoHideTaskbar.AutoHideTaskbarEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* When the auto hide feature is enabled SWF Studio hides the taskbar when your application is running as a normal window and shows the taskbar when your application is minimized (since minimized applications live in the taskbar).
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_autoHideTaskbar.html Northcode Help Documentation
	*/
	public class AutoHideTaskbar extends Desktop
	{
		// Optional
		/**
		* A boolean value that controls the state of the auto hide taskbar feature.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Desktop.AutoHideTaskbar()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_autoHideTaskbar.html Northcode Help Documentation
		*/
		public function AutoHideTaskbar(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* When the auto hide feature is enabled SWF Studio hides the taskbar when your application is running as a normal window and shows the taskbar when your application is minimized (since minimized applications live in the taskbar).
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_autoHideTaskbar.html Northcode Help Documentation
		*/
		public function autoHideTaskbar():void
		{
			ssCore.Desktop.autoHideTaskbar( {flag:flag}
										   ,{callback:actionComplete, errorSTR:"autoHideTaskbarError", code:"19000"} );
		}
	}
}