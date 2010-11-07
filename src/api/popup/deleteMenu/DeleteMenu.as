package api.popup.deleteMenu
{
	import flash.events.IEventDispatcher;
	import api.popup.Popup;
	
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class DeleteMenu extends Popup
	{
		// Required
		public var name:String = null;
		
		public function DeleteMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function deleteMenu( menuName:String = null ):void
		{
			name = compareStrings( menuName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Popup.deleteMenu( {name:name}
											,{callback:actionComplete, errorSTR:"deleteMenuError", code:"31001"} );
			}
		}
	}
}