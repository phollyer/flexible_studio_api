package api.desktop.saveImage
{
	import flash.events.IEventDispatcher;
	
	import api.desktop.Desktop;
	import api.vos.desktop.SaveImageVO;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SaveImage extends Desktop
	{
		public var saveSettings:SaveImageVO = new SaveImageVO();
		
		public function SaveImage(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function saveImage( path:String = null ):void
		{
			saveSettings.path = compareStrings( path , saveSettings.path );
			switch( saveSettings.path )
			{
				case null:
					missingPath();
					break;
				default:
					var __o:Object = saveSettings.getObject();
					ssCore.Desktop.saveImage( __o
											,{callback:actionComplete, errorSTR:"saveImageError", code:"19003"} );
			}
		}
	}
}