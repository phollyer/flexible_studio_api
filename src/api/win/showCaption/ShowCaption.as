package api.win.showCaption
{
	import api.events.win.showCaption.ShowCaptionEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showCaption.html Northcode Help Documentation
	*/
	public class ShowCaption extends Win
	{
		// Optional
		/**
		* 
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
		*
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