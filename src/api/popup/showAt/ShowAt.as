package api.popup.showAt
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.popup.showAt.ShowAtEvent;
	import api.popup.Popup;
	
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.popup.showAt.ShowAtEvent")]
	[Bindable]
	public class ShowAt extends Popup
	{
		// Optional
		public var x:Number = 0;
		public var y:Number = 0;
		
		// Required
		public var name:String = null;
		
		// Result
		public var itemID:String = null;
		
		public function ShowAt(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showAt( menuName:String = null ):void
		{
			name = compareStrings( menuName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Popup.showAt( {name:name , x:x , y:y}
									    ,{callback:actionComplete, errorSTR:"showAtError", code:"31011"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			itemID = r.result;
			
			var e : ShowAtEvent = new ShowAtEvent( ShowAtEvent.RESULT );
			e.itemID = itemID;
			dispatchEvent( e );
		}
	}
}