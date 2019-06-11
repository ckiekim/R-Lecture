library(dplyr)
midwest
mw <- midwest %>%
  filter(poptotal <= 500000 && popasian <= 10000)
options(scipen = 10)
ggplot(mw, aes(x=poptotal, y=popasian)) +
  geom_point() +
  xlim(0,500000) + ylim(0,10000)

df_suv <- mpg %>%
  filter(class == 'suv') %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(5)
ggplot(df_suv, aes(x=reorder(manufacturer, -mean_cty), y=mean_cty,
                   fill=manufacturer)) +
  geom_col()

df_class <- mpg %>%
  group_by(class) %>%
  summarise(count = n())
ggplot(df_class, aes(x=class, y=count, fill=class)) +
  geom_col()
ggplot(mpg, aes(x=class, fill=class)) +
  geom_bar()

economics
ggplot(data = economics, aes(x = date, y = psavert)) + 
  geom_line()

df_3class <- mpg %>%
  filter(class %in% c("compact", "subcompact", "suv"))
ggplot(df_3class, aes(x=class, y=cty, fill=class)) +
  geom_boxplot()

diamonds
str(diamonds)
ggplot(diamonds, aes(x=cut, fill=cut)) +
  geom_bar()
df_cut <- diamonds %>%
  group_by(cut) %>%
  summarise(mean_price = mean(price))
ggplot(df_cut, aes(x=cut, y=mean_price, fill=cut)) +
  geom_col()
df_color <- diamonds %>%
  group_by(color) %>%
  summarise(mean_price = mean(price)) 
ggplot(df_color, aes(x=color, y=mean_price, fill=color)) +
  geom_col()

ggplot(diamonds, aes(x=price)) +
  geom_histogram(bins=10) +
  facet_wrap(~cut + color)

df_cut_fair <- diamonds %>%
  filter(cut == 'Fair') %>%
  group_by(color) %>%
  summarise(mean_price=mean(price))
g_fair <- ggplot(df_cut_fair, aes(x=color, y=mean_price, fill=color)) +
  geom_col() +
  ggtitle('Cut = Fair') +
  theme(plot.title=element_text(face="bold", size=20, vjust=1, color="red"))

df_cut_good <- diamonds %>%
  filter(cut == 'Good') %>%
  group_by(color) %>%
  summarise(mean_price=mean(price))
g_good <- ggplot(df_cut_good, aes(x=color, y=mean_price, fill=color)) +
  geom_col() +
  ggtitle('Cut = Good') +
  theme(plot.title=element_text(face="bold", size=20, vjust=1, color="red"))

df_cut_vg <- diamonds %>%
  filter(cut == 'Very Good') %>%
  group_by(color) %>%
  summarise(mean_price=mean(price))
g_vg <- ggplot(df_cut_vg, aes(x=color, y=mean_price, fill=color)) +
  geom_col() +
  ggtitle('Cut = Very Good') +
  theme(plot.title=element_text(face="bold", size=20, vjust=1, color="red"))

df_cut_premium <- diamonds %>%
  filter(cut == 'Premium') %>%
  group_by(color) %>%
  summarise(mean_price=mean(price))
g_premium <- ggplot(df_cut_premium, aes(x=color, y=mean_price, fill=color)) +
  geom_col() +
  ggtitle('Cut = Premium') +
  theme(plot.title=element_text(face="bold", size=20, vjust=1, color="red"))

df_cut_ideal <- diamonds %>%
  filter(cut == 'Ideal') %>%
  group_by(color) %>%
  summarise(mean_price=mean(price))
g_ideal <- ggplot(df_cut_ideal, aes(x=color, y=mean_price, fill=color)) +
  geom_col() +
  ggtitle('Cut = Ideal') +
  theme(plot.title=element_text(face="bold", size=20, vjust=1, color="red"))

grid.arrange(g_fair, g_good, g_vg, g_premium, g_ideal, ncol=3,
             top = 'Cut과 Color에 따른 가격 변화')
