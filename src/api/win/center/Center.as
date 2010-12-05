package api.win.center
{
	import api.events.win.center.CenterEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Center the application window.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_center.html Northcode Help Documentation
	*/
	public class Center extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var centerOnPrimarydisplay:Boolean = true;
		
		/**
		* Constructor for Win.Center()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_center.html Northcode Help Documentation
		*/
		public function Center(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Center the application window.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_center.html Northcode Help Documentation
		*/
		public function center():void
		{
			ssCore.Win.center( {centerOnPrimarydisplay:centerOnPrimarydisplay}
							  ,{callback:actionComplete, errorSTR:"centerError", code:"6001"} );
		}
	}
}