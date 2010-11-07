package api.popup.setMenu
{
	import flash.events.IEventDispatcher;
	import api.popup.Popup;
	
	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetMenu extends Popup
	{
		// Required
		public var name:String = null;
		public var resource:String = null;
		
		public function SetMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setMenu( menuName:String = null , resourceSTR:String = null ):void
		{
			name = compareStrings( menuName , name );
			resource = compareStrings( resourceSTR , resource );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					switch( resource )
					{
						case null:
							missingResource();
							break;
						default:
							ssCore.Popup.setMenu( {name:name , resource:resource}
												 ,{callback:actionComplete, errorSTR:"setMenuError", code:"31008"} );
					}
			}
		}

	}
}