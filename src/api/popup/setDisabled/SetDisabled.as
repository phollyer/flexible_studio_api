package api.popup.setDisabled
{
	import flash.events.IEventDispatcher;
	import api.popup.Popup;
	
	[Event(name="missingFlag" , type="api.events.SWFStudioEvent")]
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingID" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetDisabled extends Popup
	{
		public static const CHECKED:String = "true";
		public static const UNCHECKED:String = "false";
		public static const TOGGLE:String = "toggle";
		
		// Required
		public var name:String = null;
		public var id:String = null;
		public var flag:String = null;
		
		public function SetDisabled(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setDisabled( menuName:String = null , itemID:String = null , checkedFlag:String = null ):void
		{
			name = compareStrings( menuName , name );
			id = compareStrings( itemID , id );
			flag = compareStrings( checkedFlag , flag );
			
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
							switch( flag )
							{
								case null:
									missingFlag();
									break;
								case CHECKED:
								case TOGGLE:
								case UNCHECKED:
									ssCore.Popup.setDisabled( {name:name , id:id , flag:flag}
														     ,{callback:actionComplete, errorSTR:"setDisabledError", code:"31007"} );
									break;
								default:
									invalidFlag();
							}
					}
			}
		}
		private function invalidFlag():void
		{
			var e : SetDisabledEvent = new SetDisabledEvent( SetDisabledEvent.RESULT_FLAG );
			dispatchEvent( e );
		}


	}
}