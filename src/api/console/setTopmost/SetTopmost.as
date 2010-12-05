package api.console.setTopmost
{
	import api.console.Console;

	import api.events.console.setTopmost.SetTopmostEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Set (or clear) the topmost property of the console window so it can appear above (or below) your application.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_setTopmost.html Northcode Help Documentation
	*/
	public class SetTopmost extends Console
	{
		/**
		* A flag indicates whether the console window should be a topmost window or not. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Console.SetTopmost()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_setTopmost.html Northcode Help Documentation
		*/
		public function SetTopmost(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set (or clear) the topmost property of the console window so it can appear above (or below) your application.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_setTopmost.html Northcode Help Documentation
		*/
		public function setTopmost():void
		{
			flag = true;
			setWindow();
		}
		public function clearTopmost():void
		{
			flag = false;
			setWindow();
		}
		private function setWindow():void
		{			
			ssCore.Console.setTopmost( {flag:flag} , {callback:actionComplete, errorSTR:"setTopmostError", code:"14003"} );
		}
	}
}