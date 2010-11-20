package api.popup.removeItem
{
	import flash.events.IEventDispatcher;
	import api.popup.Popup;
	
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingID" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class RemoveItem extends Popup
	{
		// Required
		public var name:String = null;
		public var id:String = null;
		
		public function RemoveItem(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function removeItem( menuName:String = null , itemID:String = null ):void
		{
			name = compareStrings( menuName , name );
			id = compareStrings( itemID , id );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					switch( id )
					{
						case null:
							missingID();
							break;
						default:
							ssCore.Popup.removeItem( {name:name , id:id}
												  ,{callback:actionComplete, errorSTR:"removeItemError", code:"31005"} );
					}
			}
		}

	}
}