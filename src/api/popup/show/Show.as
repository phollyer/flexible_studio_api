package api.popup.show
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.popup.show.ShowEvent
	import api.popup.Popup;
	
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.popup.show.ShowEvent")]
	[Bindable]
	public class Show extends Popup
	{
		// Required
		public var name:String = null;
		
		// Result
		public var itemID:String = null
		
		public function Show(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show( menuName:String = null ):void
		{
			name = compareStrings( menuName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Popup.show( {name:name}
									  ,{callback:actionComplete, errorSTR:"showError", code:"31010"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			itemID = r.result;
			
			var e : ShowEvent = new ShowEvent( ShowEvent.RESULT );
			e.itemID = itemID;
			dispatchEvent( e );
		}
	}
}