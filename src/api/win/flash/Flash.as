package api.win.flash
{
	import api.events.win.flash.FlashEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_flash.html Northcode Help Documentation
	*/
	public class Flash extends Win
	{
		// Optional
		/**
		* 
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
		*
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