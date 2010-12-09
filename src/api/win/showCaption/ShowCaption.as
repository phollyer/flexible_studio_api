package api.win.showCaption
{
	import api.events.win.showCaption.ShowCaptionEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Show or hide the window caption (title) at runtime. When the caption is enabled, the window border is enabled as well. When the caption is disabled, only the caption is disabled, the border remains enabled.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showCaption.html Northcode Help Documentation
	*/
	public class ShowCaption extends Win
	{
		// Optional
		/**
		* A true/false flag that determines whether the caption will be visible or not. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Win.ShowCaption()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showCaption.html Northcode Help Documentation
		*/
		public function ShowCaption(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Show or hide the window caption (title) at runtime. When the caption is enabled, the window border is enabled as well. When the caption is disabled, only the caption is disabled, the border remains enabled.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showCaption.html Northcode Help Documentation
		*/
		public function showCaption():void
		{
			ssCore.Win.showCaption( {flag:flag}
								   ,{callback:actionComplete, errorSTR:"showCaptionError", code:"6034"} );
		}
	}
}