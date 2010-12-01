package api.win.setTopmost
{
	import api.events.win.setTopmost.SetTopmostEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setTopmost.html Northcode Help Documentation
	*/
	public class SetTopmost extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var aggressive:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Win.SetTopmost()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setTopmost.html Northcode Help Documentation
		*/
		public function SetTopmost(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setTopmost.html Northcode Help Documentation
		*/
		public function setTopmost():void
		{
			ssCore.Win.setTopmost( {aggrseeive:aggressive , flag:flag}
								  ,{callback:actionComplete, errorSTR:"setTopmostError", code:"6030"} );
		}
	}
}