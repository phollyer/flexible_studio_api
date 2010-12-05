package api.win.show
{
	import api.events.win.show.ShowEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Show or hide the window border at runtime. If the window has a caption (title) When the border is disabled, the caption will be disabled as well.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_show.html Northcode Help Documentation
	*/
	public class Show extends Win
	{
		/**
		* Constructor for Win.Show()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_show.html Northcode Help Documentation
		*/
		public function Show(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Show or hide the window border at runtime. If the window has a caption (title) When the border is disabled, the caption will be disabled as well.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_show.html Northcode Help Documentation
		*/
		public function show():void
		{
			ssCore.Win.show( {}
							,{callback:actionComplete, errorSTR:"showError", code:"6031"} );
		}
	}
}