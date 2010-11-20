package api.popup.addItem
{
	import flash.events.IEventDispatcher;
	import api.popup.Popup;
	import api.vos.popup.ItemVO;
	
	[Event(name="missingItem" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class AddItem extends Popup
	{
		// Required
		public var item:ItemVO = null;
		
		public function AddItem(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function addItem( itemVO:ItemVO = null ):void
		{
			item = compareVOs( itemVO , item );
			switch( item )
			{
				case null:
					missingItem();
					break;
				default:
					ssCore.Popup.addItem( {name:item.name , id:item.id , parent:item.parent , text:item.text , type:item.type , flags:item.flags}
										,{callback:actionComplete, errorSTR:"addItemError", code:"31000"} );
			}
		}
		private function compareVOs( first:ItemVO , second:ItemVO ):ItemVO
		{
			switch( first )
			{
				case null:
					first = second;
			}
			return first;
		}
	}
}