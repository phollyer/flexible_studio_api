package api.win.maximize
{
	import api.events.win.maximize.MaximizeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Maximize the application window.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_maximize.html Northcode Help Documentation
	*/
	public class Maximize extends Win
	{
		/**
		* Constructor for Win.Maximize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_maximize.html Northcode Help Documentation
		*/
		public function Maximize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Maximize the application window.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_maximize.html Northcode Help Documentation
		*/
		public function maximize():void
		{
			ssCore.Win.maximize( {}
								,{callback:actionComplete, errorSTR:"maximizeError", code:"6012"} );
		}
	}
}