package api.desktop.showTaskbar
{
	import api.desktop.Desktop;

	import api.events.desktop.showTaskbar.ShowTaskbarEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Show (or hide) the taskbar on the desktop.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_showTaskbar.html Northcode Help Documentation
	*/
	public class ShowTaskbar extends Desktop
	{
		// Optional
		/**
		* A boolean value that indicates the desired state of the taskbar, TRUE=visible and FALSE=hidden.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Desktop.ShowTaskbar()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_showTaskbar.html Northcode Help Documentation
		*/
		public function ShowTaskbar(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Show (or hide) the taskbar on the desktop.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_showTaskbar.html Northcode Help Documentation
		*/
		public function showTaskbar():void
		{
			ssCore.Desktop.showTaskbar( {flag:flag}
									   ,{callback:actionComplete, errorSTR:"showTaskbarError", code:"19004"} );
		}
	}
}