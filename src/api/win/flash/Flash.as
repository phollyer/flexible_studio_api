package api.win.flash
{
	import api.events.win.flash.FlashEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Flashes the player window but does not change the active state of the window.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_flash.html Northcode Help Documentation
	*/
	public class Flash extends Win
	{
		// Optional
		/**
		* If this parameter is TRUE, the window is flashed from one state to the other. If it is FALSE, the window is returned to its original state (either active or inactive). When an application is minimized and this parameter is TRUE, the taskbar window button flashes active/inactive. If it is FALSE, the taskbar window button flashes inactive, meaning that it does not change colors. It flashes, as if it were being redrawn, but it does not provide the visual invert clue to the user. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var invert:Boolean = true;
		
		/**
		* Constructor for Win.Flash()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_flash.html Northcode Help Documentation
		*/
		public function Flash(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Flashes the player window but does not change the active state of the window.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_flash.html Northcode Help Documentation
		*/
		public function flash():void
		{
			ssCore.Win.flash( {invert:invert}
							 ,{callback:actionComplete, errorSTR:"flashError", code:"6002"} );
		}
	}
}