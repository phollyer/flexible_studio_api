package api.win.saveImage
{
	import flash.events.IEventDispatcher;
	import api.vos.win.SaveImageVO;
	import api.win.Win;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SaveImage extends Win
	{
		// Optional
		public var settings:SaveImageVO = new SaveImageVO();
		
		public function SaveImage(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function saveImage( filePath:String = null ):void
		{
			settings.path = compareStrings( filePath , settings.path );
			
			switch( settings.path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Win.saveImage( settings.createObject()
										,{callback:actionComplete, errorSTR:"saveImageError", code:"6015"} );
			}
		}
	}
}