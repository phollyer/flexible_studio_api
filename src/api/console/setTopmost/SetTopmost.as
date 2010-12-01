package api.console.setTopmost
{
	import api.console.Console;

	import api.events.console.setTopmost.SetTopmostEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_setTopmost.html Northcode Help Documentation
	*/
	public class SetTopmost extends Console
	{
		/**
		* 
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
		*
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