package api.win.hide
{
	import api.events.win.hide.HideEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_hide.html Northcode Help Documentation
	*/
	public class Hide extends Win
	{
		/**
		* Constructor for Win.Hide()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_hide.html Northcode Help Documentation
		*/
		public function Hide(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_hide.html Northcode Help Documentation
		*/
		public function hide():void
		{
			ssCore.Win.hide( {}
							,{callback:actionComplete, errorSTR:"hideError", code:"6007"} );
		}
	}
}