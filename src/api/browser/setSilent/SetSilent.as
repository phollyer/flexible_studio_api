package api.browser.setSilent
{
	import api.browser.Browser;

	import api.events.browser.setSilent.SetSilentEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Controls whether the browser should display dialog boxes (for script errors etc).
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setSilent.html Northcode Help Documentation
	*/
	public class SetSilent extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var _flag:Boolean = false;
		
		/**
		* Constructor for Browser.SetSilent()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setSilent.html Northcode Help Documentation
		*/
		public function SetSilent(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Controls whether the browser should display dialog boxes (for script errors etc).
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setSilent.html Northcode Help Documentation
		*/
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