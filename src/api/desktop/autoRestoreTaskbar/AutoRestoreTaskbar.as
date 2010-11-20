package api.desktop.autoRestoreTaskbar
{
	import api.desktop.Desktop;

	import api.events.desktop.autoRestoreTaskbar.AutoRestoreTaskbarEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_autoRestoreTaskbar.html Northcode Help Documentation
	*/
	public class AutoRestoreTaskbar extends Desktop
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Desktop.AutoRestoreTaskbar()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_autoRestoreTaskbar.html Northcode Help Documentation
		*/
		public function AutoRestoreTaskbar(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_autoRestoreTaskbar.html Northcode Help Documentation
		*/
		public function autoRestoreTaskbar():void
		{
			ssCore.Desktop.autoRestoreTaskbar( {flag:flag}
											  ,{callback:actionComplete, errorSTR:"autoRestoreTaskbarError", code:"19001"} );
		}
	}
}