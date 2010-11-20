package api.popup.newMenu
{
	import flash.events.IEventDispatcher;
	import api.popup.Popup;
	
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class NewMenu extends Popup
	{
		// Required
		public var name:String = null;
		
		public function NewMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function newMenu( menuName:String = null ):void
		{
			name = compareStrings( menuName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Popup.newMenu( {name:name}
										 ,{callback:actionComplete, errorSTR:"newMenuError", code:"31004"} );
			}
		}
	}
}