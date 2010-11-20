package api.win.setCaption
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetCaption extends Win
	{
		// Required
		public var text:String = null;
		
		public function SetCaption(target:IEventDispatcher=null)
		{
			super(target);
		}
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