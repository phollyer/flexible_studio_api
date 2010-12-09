package api.win.minimize
{
	import api.events.win.minimize.MinimizeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* minimize the application window.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_minimize.html Northcode Help Documentation
	*/
	public class Minimize extends Win
	{
		/**
		* Constructor for Win.Minimize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_minimize.html Northcode Help Documentation
		*/
		public function Minimize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* minimize the application window.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_minimize.html Northcode Help Documentation
		*/
		public function minimize():void
		{
			ssCore.Win.minimize( {}
								,{callback:actionComplete, errorSTR:"minimizeError", code:"6013"} );
		}
	}
}