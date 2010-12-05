package api.win.setCaption
{
	import api.events.win.setCaption.SetCaptionEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>text</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_TEXT
	*/
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Change the application's window caption (title) at runtime.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setCaption.html Northcode Help Documentation
	*/
	public class SetCaption extends Win
	{
		// Required
		/**
		* A string containing the new window caption.
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		
		/**
		* Constructor for Win.SetCaption()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setCaption.html Northcode Help Documentation
		*/
		public function SetCaption(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Change the application's window caption (title) at runtime.
		*
		*
		* @param captionText
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setCaption.html Northcode Help Documentation
		*/
		public function setCaption( captionText:String ):void
		{
			text = compareStrings( captionText , text );
			
			switch( text )
			{
				case null:
					missingText();
					break;
				default:
					ssCore.Win.setCaption( {text:text}
										  ,{callback:actionComplete, errorSTR:"setCaptionError", code:"6020"} );
			}
		}
	}
}