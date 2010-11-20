package api.popup.setText
{
	import flash.events.IEventDispatcher;
	import api.popup.Popup;
	
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingID" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetText extends Popup
	{
		// Required
		public var name:String = null;
		public var id:String = null;
		public var text:String = null;
		
		public function SetText(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setText( menuName:String = null , itemID:String = null , textSTR:String = null ):void
		{
			name = compareStrings( menuName , name );
			id = compareStrings( itemID , id );
			text = compareStrings( textSTR , text );
			
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
							switch( text )
							{
								case null:
									missingText();
									break;
								default:
									ssCore.Popup.setText( {name:name , id:id , text:text}
														 ,{callback:actionComplete, errorSTR:"setTextError", code:"31009"} );
							}
					}
			}
		}


	}
}