package api.desktop.autoHideTaskbar
{
	import api.desktop.Desktop;

	import api.events.desktop.autoHideTaskbar.AutoHideTaskbarEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_autoHideTaskbar.html Northcode Help Documentation
	*/
	public class AutoHideTaskbar extends Desktop
	{
		// Optional
		/**
		* 
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
		*
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